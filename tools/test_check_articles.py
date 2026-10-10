"""Regression checks for the manual's conversion-damage audit."""

from pathlib import Path
import tempfile
import unittest

import markdown

from check_articles import EXTENSIONS, check_html, check_source


class ArticleAuditTests(unittest.TestCase):
    def check(self, source):
        with tempfile.TemporaryDirectory() as directory:
            return check_source(source, Path(directory))

    def test_does_not_interpret_quoted_code_as_html(self):
        source = '> ``` csound-orc\n> prints "<quote>literal</quote>"\n> ```\n'
        self.assertEqual(self.check(source), [])
        self.assertEqual(self.check('A literal `<quote>` or ```<literal>```.'), [])

    def test_catches_unclosed_fences_and_broken_synopses(self):
        source = '## Syntax\n=== "Modern"\n    ``` csound-orc\n    a = pow(a, k= pow([, norm])\n    ```\n'
        self.assertIn('syntax-delimiters', {issue['rule'] for issue in self.check(source)})
        self.assertEqual(self.check('```\noutput\n```-modern\n')[0]['rule'], 'unclosed-fence')

    def test_optional_arguments_arrays_and_strings_are_balanced(self):
        source = '## Syntax\n=== "Modern"\n    ``` csound-orc\n    kOut[] = opcode(kIn[][, iMode])\n    prints(")")\n    ```\n'
        self.assertEqual(self.check(source), [])

    def test_full_csd_uses_document_highlighting(self):
        with tempfile.TemporaryDirectory() as directory:
            docs = Path(directory)
            (docs / 'example.csd').write_text('<CsoundSynthesizer>\n</CsoundSynthesizer>')
            source = '``` csound-orc\n--8<-- "example.csd"\n```\n'
            self.assertEqual(check_source(source, docs)[0]['rule'], 'csd-language')
            self.assertEqual(check_source(source.replace('csound-orc', 'csound-csd'), docs), [])

    def test_entities_are_valid_in_prose_but_not_code_titles(self):
        self.assertEqual(self.check('The &gt; operator.'), [])
        self.assertEqual(self.check('``` csound-csd title="Example of &gt;"\n```')[0]['rule'], 'encoded-title')
        self.assertEqual(self.check('settings&namerasmus;')[0]['rule'], 'unknown-entity')

    def test_blank_lines_prevent_invalid_paragraphs_around_code(self):
        broken = 'An example:\n``` csound-orc\na = 0\n```\n'
        fixed = 'An example:\n\n``` csound-orc\na = 0\n```\n'
        self.assertTrue(check_html(markdown.markdown(broken, extensions=EXTENSIONS)))
        self.assertEqual(check_html(markdown.markdown(fixed, extensions=EXTENSIONS)), [])


if __name__ == '__main__':
    unittest.main()

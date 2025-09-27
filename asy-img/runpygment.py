#! /usr/bin/env python3
# pygmentize an asy file given by sys.argv[1]

import sys
import pygments
from pygments.lexers import AsymptoteLexer
from pygments.formatters import LatexFormatter


begin_token = r"// <pygmentize>"
end_token = r"// </pygmentize>"

class bcolors:
    HEADER = '\033[95m'
    OKBLUE = '\033[94m'
    OKCYAN = '\033[96m'
    OKGREEN = '\033[92m'
    WARNING = '\033[93m'
    FAIL = '\033[91m'
    ENDC = '\033[0m'
    BOLD = '\033[1m'
    UNDERLINE = '\033[4m'

def read_file(filename:str) -> [str]:
    lines = []
    start_collect = False
    with open(filename) as f:
        for line in f:
            stripped = line.strip()
            if stripped == begin_token:
                start_collect = True
                continue
            if stripped == end_token:
                break
            if start_collect:
                lines.append( line.rstrip() )
    return lines


def pymentize_asy_code(lines:[str], output_filename) -> None:
    asy_code = '\n'.join(lines)
    lexer = AsymptoteLexer()  #pygments.lexers.get_lexer_by_name("Asymptote")
    formatter = LatexFormatter() #pygments.formatters.get_formatter_by_name("latex")
    output_file = open(output_filename, 'w')
    pygments.highlight(asy_code, lexer, formatter, output_file)


if __name__ == "__main__":
    filename = sys.argv[1]
    asy_code_line = read_file(filename)
    if len(asy_code_line) > 0:
        tex_output_filename = filename.replace('.asy', '.tex')
        pymentize_asy_code(asy_code_line, tex_output_filename)
    else:
        print(f"{bcolors.WARNING}    No code from {filename} is extracted {bcolors.ENDC}")



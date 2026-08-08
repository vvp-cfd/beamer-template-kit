import argparse
import os
import re
import json
from jinja2 import Template, Environment, FileSystemLoader  # pip install Jinja2


class RowData:
    def __init__(self, row, mr_id=0):
        self.url_string = []
        self.updates = row
        self.tag = None
        self.mr_id = mr_id

    def fill_row_data(self, file_name, tags):
        self.url_string = file_name
        self.tag = tags

    def __lt__(self, other):
        return self.mr_id < other.mr_id


def concatenator(lists_list):
    return [*lists_list[0], *lists_list[1], *lists_list[2]]


parser = argparse.ArgumentParser(description = 'Running all demos and testing them.')
parser.add_argument('--jsons_path', default='reports/', type=str, dest='jsons_path',
                    help='Path to json files')
parser.add_argument('--html_path', default='reports/index.html', type=str, dest='html_path',
                    help='Path to html file')

args = parser.parse_args()

regexp = re.compile(r'.*\.json')
#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""
Create an acrostic list. Row is the acrostic.  Column is the session.
"""

import os
import pandas
import glob
import argparse
import sys


def _argparse():
    """ Get command line arguments.

    """
    parser = argparse.ArgumentParser(prog='processing_status')

    parser.add_argument("-v", "--verbose", help="Display acrostic list",
                        action="store_true",
                        default=False)

    return parser.parse_args()


def main():

    in_args = _argparse()

    active_bids_path = os.getenv('ACTIVE_BIDS_PATH')

    df0 = pandas.DataFrame({'directory': glob.glob(os.path.join(active_bids_path, 'sub-*', 'ses-*'))})
    df0.directory = df0.directory.str.replace(active_bids_path, '')
    df = df0.directory.str.split('/', expand=True).copy()

    df.columns = ['index', 'subject', 'session']
    df.subject = df.subject.str.replace('sub-', '')
    # df.session = df.session.str.replace('ses-', '')

    df = df.drop('index', axis=1)
    df['acquired'] = True

    df = df.set_index(['subject', 'session']).unstack().fillna(False)
    df.columns = ['ses-1', 'ses-2']

    df.to_csv('acrostic.csv')

    if in_args.verbose:
        print(df)


# ====================================================================================================================
# region Command Line Interface


if __name__ == '__main__':

    sys.exit(main())

# endregion

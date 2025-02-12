# Configuration file for the Sphinx documentation builder.
#
# For the full list of built-in configuration values, see the documentation:
# https://www.sphinx-doc.org/en/master/usage/configuration.html

import os
import sys

# -- Project information -----------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#project-information

project = "python-dev"
copyright = "2025, Zhilong Wei"
author = "Zhilong Wei"
release = "0.1.0"

# -- Path setup: ensure Sphinx finds your modules ----------------------------
sys.path.insert(0, os.path.abspath("../.."))
# ^ This means docs/source/conf.py -> ../.. will point to your project root.

# -- General configuration ---------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#general-configuration

extensions = [
    "sphinx.ext.autodoc",  # For autodoc
    "sphinx.ext.napoleon",  # For NumPy/Google style docstrings
    "myst_parser",  # For Markdown support (if desired)
]

templates_path = ["_templates"]
exclude_patterns = []


# -- Options for HTML output -------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#options-for-html-output

html_theme = "sphinx_rtd_theme"  # ReadTheDocs theme
html_static_path = ["_static"]

.. _installation:

==============
 Installation
==============

Virtual environment
===================

If you have a supported Python installation on your computer, you can
install the package in a virtual environment like so:

.. code-block:: bash

    # create a virtual environment (called venv)
    python3 -m venv venv

    # activate virtual environment
    . ./venv/bin/activate

    # install the project in editable state
    pip install -e .

    # optionally install JupyterLab and Jupyter Widgets
    pip install jupyterlab ipywidgets


For development, the packages listed in `requirements.txt` need to be installed:

.. code-block:: bash

    pip install -r requirements.txt


To build the documentation locally, run:

.. code-block:: bash

    cd docs
    make doctest # optionally check if your examples work
    make html
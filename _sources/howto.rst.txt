.. _howto:

===========
Installation 
===========

How to use
===========

The current documentation presents a test case and its study.

In the section :ref:`sphpend`, the problem is described from a theoretical point of view.
One can read the equations of the motion, which are solved later by the MATLAB code.

In the section :ref:`lieintegr`, three formulations of Lie integrators are given and explained.

Finally, in section :ref:`matlab`, the code is documented.
Looking at the code, it is organized in folders.
The first one, :ref:`src`, refers to the main folder in which the test case is solved.
Launching the script `main.m` will result in the saving of the parameters and solution files in the folder `out/`.
Inside the `main.m`, it is possible to define the physical and numerical parameters, as well as the numerical method the user wants to adopt in the solution of the equations.
The other functions are specific to the problem and evaluate the problem, its residual and Jacobian.
The first subfolder, :ref:`src_integr`, contains the Lie group integrators described before and the useful functions of the relative manifold in which the problem is set.
Among the useful functions there are the exponential and the group action of :math:`SE(3)=SO(3)\ltimes\mathbb{R}^3`.
In the last subfolder, :ref:`src_post`, there are some functions for the post-processing analysis.
Those functions are not called in the main script, which only solves the problem saving the solutions.
To examine the results, first use `readAll.m` to read the files in the folder `out/`.
Once `readAll.m` finishes, the results will be stored in two cell variables of size equal to the total number of solutions.
The first cell variable contains the parameters of each solution run, while the second cell variable contains the matrices with the solution at each time step.
The following functions are written to use the parameters and the solutions in the format given by the `readAll.m` script.


Virtual environment
===================

If you have a supported Python installation on your computer, you can
install the package in a virtual environment like so:

.. code-block:: bash

    # create a virtual environment (called venv)
    python3 -m venv venv

    # activate virtual environment
    . ./venv/bin/activate
    
    # install packages listed in `requirements.txt`, e.g. sphinx
    pip install -r requirements.txt
    
    # to build the documentation locally, run:
    cd docs
    make doctest # optionally check if your examples work
    make html

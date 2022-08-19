.. _matlab:

=============
 MATLAB code
=============

src
===========

.. mat:automodule:: src

:mod:`src` module contains some functions
implementing Lie group time integrators.

For example, the Lie forward Euler:

.. mat:autofunction:: src.LieEuler

The Newton-Raphson algorithm for implicit methods:

.. mat:autofunction:: src.NewtonRaphson

Some useful function for the operation in the Lie group:

.. mat:autofunction:: src.actionSE3

.. mat:autofunction:: src.expSE3
    
The module further contains an example script and related functions:

.. mat:autoscript:: src.main

.. mat:autofunction:: src.fManiToAlgebra

.. mat:autofunction:: src.initializeSE3

.. mat:autofunction:: src.residualSE3

.. mat:autofunction:: src.jacobianSE3

Among the post-processing functions, we are interested in evaluate the distance between two solutions of the problem:

.. mat:autofunction:: src.riemannianDistance

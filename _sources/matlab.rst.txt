.. _matlab:

=============
 MATLAB code
=============

src
===========

.. mat:automodule:: src

:mod:`src` module contains some functions
implementing Lie group time integrators
    
.. mat:autofunction:: src.LieEuler

.. mat:autofunction:: src.actionSE3

.. mat:autofunction:: src.expSE3

A function implements the Newton-Raphson algorithm for implicit methods:

.. mat:autofunction:: src.NewtonRaphson
    
The module further contains an example script and related functions:

.. mat:autoscript:: src.main

.. mat:autofunction:: src.fManiToAlgebra

.. mat:autofunction:: src.initializeSE3

.. mat:autofunction:: src.residualSE3

.. mat:autofunction:: src.jacobianSE3

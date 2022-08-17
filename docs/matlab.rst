.. _matlab:

=============
 MATLAB code
=============

src
===========

.. mat:automodule:: src

:mod:`src` module contains some functions
implementing Lie group time integrators
    
.. mat:autofunction:: src.main

.. mat:autoscript:: src.LieEuler

.. mat:autoscript:: src.actionSE3

.. mat:autoscript:: src.expSE3

A function implements the Newton-Raphson algorithm for implicit methods:

.. mat:autoscript:: src.NewtonRaphson
    
The module further contains an example script and related functions:

.. mat:autoscript:: src.fManiToAlgebra

.. mat:autoscript:: src.initializeSE3

.. mat:autoscript:: src.residualSE3

.. mat:autoscript:: src.jacobianSE3

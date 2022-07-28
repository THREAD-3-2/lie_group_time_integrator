.. _matlab:

=============
 MATLAB code
=============

matlab_src
========

.. mat:automodule:: matlab_src

:mod:`matlab_src` module contains some functions
implementing Lie group time integrators
    
.. mat:autofunction:: matlab_src.LieEuler
.. mat:autofunction:: matlab_src.NewtonRaphson
.. mat:autofunction:: matlab_src.actionSE3
.. mat:autofunction:: matlab_src.expSE3

The module further contains an example script and related functions:

.. mat:autoscript:: matlab_src.main
.. mat:autoscript:: matlab_src.fManiToAlgebra
.. mat:autoscript:: matlab_src.initializeSE3
.. mat:autoscript:: matlab_src.residualSE3
.. mat:autoscript:: matlab_src.jacobianSE3
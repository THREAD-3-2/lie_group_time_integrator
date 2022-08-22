.. _matlab:

=============
 MATLAB code
=============

src
====

.. mat:automodule:: src

:mod:`src` module contains an example script and related functions:

.. mat:autoscript:: src.main

.. mat:autofunction:: src.fManiToAlgebra

.. mat:autofunction:: src.initializeSE3

.. mat:autofunction:: src.residualSE3

.. mat:autofunction:: src.jacobianSE3

src/integrator
===============

The folder `integrator` contains some functions
implementing Lie group time integrators.

For example, the Lie forward Euler:

.. mat:autofunction:: src.integrator.LieEuler

The Newton-Raphson algorithm for implicit methods:

.. mat:autofunction:: src.integrator.NewtonRaphson

Some useful function for the operation in the Lie group:

.. mat:autofunction:: src.integrator.actionSE3

.. mat:autofunction:: src.integrator.expSE3

src/post_processing
====================

.. mat:autofunction:: src.post_processing.readAll

.. mat:autofunction:: src.post_processing.evalErr

.. mat:autofunction:: src.post_processing.plotErr

.. mat:autofunction:: src.post_processing.potential

.. mat:autofunction:: src.post_processing.plotEnergy

Among the post-processing functions, we are interested in evaluate the distance between two solutions of the problem:

.. mat:autofunction:: src.post_processing.riemannianDistance


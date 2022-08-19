.. _lieeuler:

===================
 Lie Forward Euler
===================

.. _Lie_Euler:

The Method
-----------

The Lie forward Euler solves systems of the type

.. math::

    \begin{align}
        \dot{y} = f(y)
    \end{align}

where the solutions can be searched in a Lie group setting.

The method can be express by the formula:

.. math::

    \begin{align}
        y_{n+1} = \exp{(hf(y_{n}))}\circ y_{n}
    \end{align}

where :math:`\exp` and :math:`\circ` are respectively the exponential map and the action on the considered Lie group.

.. _riemannianDistance:

The Analysis
-------------

We are interested in the analysis of the method. An interesting post-processing analysis is the measure of the distance between two trajectories.
We use the Riemannian distance on the Riemannian manifold where the solution is set. In particular, choosing the Sasaki metric, one can measure the Riemannian distance as the norm of the Logarithmic map.

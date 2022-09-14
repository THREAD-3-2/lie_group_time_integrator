
.. _sphpend:

========================
 The spherical pendulum
========================

Description of the problem
---------------------------

We consider the Lie group setting as in the paper `(Celledoni, Çokaj, Leone, Murari and Owren, (2021) International Journal of Computer Mathematics) <https://doi.org/10.1080/00207160.2021.1966772>`_. 
We limit ourselves to the case of a single spherical pendulum. 
The equations in this case are:

.. math::
    :name: eq:1

    \begin{align}
        \dot{q}  =  \omega\times q
    \end{align}

.. math::
    :name: eq:2
    
    \begin{align}
        \dot{\omega}  = -ge_3\times q,
    \end{align}

where :math:`q \in S^2` and :math:`\omega \in T_{q}S^2` denote the position and the angular velocity, respectively.  :math:`g` denotes the gravitational constant and :math:`e_3 = [0, 0, 1]^{\top}.`
This is a mechanical system with preserved energy:

.. math::

    \begin{align}
        E(q,\omega) = \tfrac12 |\omega\times q|^2 + g\langle e_3, q\rangle.
    \end{align}

We then slightly modify the system by adding two terms in :ref:`Equation (2) <eq:2>` and obtain the new equations:

.. math::

    \begin{align}
        \dot{q} & =  \omega\times q \\
        \dot{\omega} & = -ge_3\times q - d\omega + k\langle\omega, q\rangle q
    \end{align}
The first term, :math:`-d\omega`, is a damping term, while the term :math:`k\langle\omega, q\rangle q` is equal to zero :math:`\forall (q, \omega)\in TS^2`.
This second term is a useful tool to verify that the integrator solves the problem on the manifold.
In fact, by performing the integration with a classical integrator, e.g. ode45 on Matlab, the solution does not remain on the manifold and rapidly deviates from the expected trajectory.


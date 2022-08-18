
.. _sphpend:

===================================================
 The spherical pendulum: description of the problem 
===================================================

We consider the Lie group setting as in the paper by Elena Celledoni, Ergys Çokaj, Andrea Leone, Davide Murari and Brynjulf Owren, "Lie group integrators for mechanical systems", International Journal of Computer Mathematics, 99:1, 58-88. 
We limit ourselves to the case of a single spherical pendulum. 
The equations in this case are:

.. math::
    :name: eq:0
    \begin{align}
        \dot{q}  =  \omega\times q
    \end{align}

.. math::
        :name: eq:1
    \begin{align}
        \dot{\omega}  = ge_3\times q,
    \end{align}

where :math:`q \in S^2` and :math:`\omega \in T_{q}S^2` denote the position and the angular velocity, respectively.  :math:`g` denotes the gravitational constant and :math:`e_3 = [0, 0, 1]^{\top}.`
This is a mechanical system with preserved energy:

.. math::

    \begin{align}
        E(q,\omega) = \tfrac12 |\omega\times q|^2 + g\langle e_3, q\rangle.
    \end{align}

We then slightly modify the system by adding two terms in :ref:`Link title <eq:1>` and obtain the new equations:

.. math::

    \begin{align}
        \dot{q} & =  \omega\times q \\
        \dot{\omega} & = ge_3\times q - d\omega + k(\omega^{\top} q)q
    \end{align}
The first term, :math:`-d\omega`, is a damping term, while the term :math:`k(\omega^{\top} q)q` is equal to zero :math:`\forall (q, \omega)\in TS^2`.



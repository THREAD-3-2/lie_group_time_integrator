.. _lieintegr:

=================
 Lie Integrators
=================

The following schemes solve systems of the form:

.. math::

    \begin{align}
        \dot{y} = A(y)y
    \end{align}

where :math:`A` is a matrix. The solutions can be searched in a Lie group setting, if :math:`A(y)` is a matrix-valued element of the corresposnding Lie algebra.

.. _Lie_Ex_Euler:

Lie Forward Euler
-------------------

The method can be expressed by the formula:

.. math::

    \begin{align}
        y_{n+1} = \exp{(hA(y_{n}))}\circ y_{n}
    \end{align}

where :math:`\exp` and :math:`\circ` are respectively the exponential map and the action on the considered Lie group, and :math:`h` is the time step size.

.. _Lie_Im_Euler:

Lie Backward Euler
--------------------

Similar to the `Lie Forward Euler`, the `Lie Backward Euler` uses the operation on the considered Lie group to find the solution.
Its scheme is:

.. math::

    \begin{align}
        y_{n+1} = \exp{(hA(y_{n+1}))}\circ y_{n}
    \end{align}

where, again, :math:`\exp` and :math:`\circ` are respectively the exponential map and the action on the considered Lie group, and :math:`h` is the time step size.

.. _Lie_midpt:

Lie Midpoint Rule
------------------

Finally, we used for comparison also a Midpoint Rule in the Lie group setting.
The expression for this method is:

.. math::

    \begin{align}
        y_{n+1} = \exp{(hA(\frac{y_{n+1}+y_{n}}{2}))}\circ y_{n}
    \end{align}

where :math:`\exp` and :math:`\circ` are respectively the exponential map and the action on the considered Lie group, and :math:`h` is the time step size.

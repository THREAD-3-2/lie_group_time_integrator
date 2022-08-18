.. _lieeuler:

===================
 Lie Forward Euler
===================

.. _mech_ibvp:

Balance equations
------------------

The local balance law of linear momentum in the dynamic process is given by

.. math::

    \begin{align}
        \nabla_{\mathbf{X}} \cdot \mathbf{P} + \rho_0 \bar{\mathbf{b}} =\rho_0\mathbf{\ddot{u}} \qquad {\rm in} \quad B
    \end{align}

subject to the Dirichlet boundary conditions

.. math::

    \begin{align}
        \mathbf{u}&=\bar{\mathbf{u}} \qquad {\rm on} \quad \partial_{u} B,
    \end{align}

the Neumann boundary conditions

.. math::

    \begin{align}
        \mathbf{P}\cdot \mathbf{N}&=\bar{\mathbf{T}} \qquad {\rm on} \quad \partial_{\sigma} B
    \end{align}

and the initial conditions

.. math::

    \begin{align}
        \mathbf{\dot{u}}=\mathbf{0},\mathbf{\ddot{u}}=\mathbf{0},
    \end{align}

where :math:`\mathbf{P}` is the first Piola-Kirchhoff stress tensor, :math:`\rho_0` is the mass density in initial configuration,
:math:`\bar{\mathbf{b}}` is the body force vector, :math:`\mathbf{\ddot{u}}` is the acceleration, :math:`\bar{\mathbf{u}}` is the prescribed displacement and 
:math:`\bar{\mathbf{T}}` is the prescribed traction. The local balance of angular momentum reads

.. math::

    \begin{align}
        \mathbf{F}\mathbf{P}^T = \mathbf{P}\mathbf{F}^T,
    \end{align}

in which :math:`\mathbf{F}` is the deformation gradient defined as :math:`\mathbf{F}=\partial\mathbf{x}(\mathbf{X},t)/ \partial \mathbf{X}`.

.. _elec_ibvp:

Maxwell equations
------------------------------

By neglecting the magnetic field, the Maxwell equations are given by

.. math::

    \begin{align}
        \nabla_{\mathbf{X}} \times \mathbf{E}^e=\mathbf{0}, \;\;\;\; \nabla_{\mathbf{X}} \cdot \mathbf{D}=0 \qquad {\rm in} \quad B
    \end{align}

subject to the Dirichlet boundary conditions

.. math::

    \begin{align}
        \phi&=\bar{\phi} \qquad {\rm on} \quad \partial_{\phi} B
    \end{align}

and the Neumann boundary conditions

.. math::

    \begin{align}
        \mathbf{D}\cdot \mathbf{N}&=\bar{Q} \qquad {\rm on} \quad \partial_D B
    \end{align}

with :math:`\mathbf{E}^e` the electric field, :math:`\mathbf{D}` the electric displacement in the initial configuration, 
:math:`\phi` the electric potential, :math:`\bar{\phi}` the prescribed electric potential, :math:`\mathbf{N}` the outward unit normal vector
and :math:`\bar{Q}` the prescribed charges per unit area on the boundary :math:`\partial_D B`. 
The Maxwell equations introduced above lead to the definition of the electric field as the gradient of a scalar electric potential

.. math::

    \begin{align} 
        \mathbf{E}^e=-\frac{\partial \phi}{\partial \mathbf{X}}.
    \end{align}


.. _kinematics_ibvp:

Kinematics in the beam
----------------------

In the Cosserat formulation of geometrically exact beam, the placement of a material point in the current configuration of the 
beam is given by

.. math::

    \begin{align}
        \mathbf{x}(X^k,s,t)=\boldsymbol{\varphi}(s,t)+X^k \mathbf{d}_k(s,t), \;\;\;\; k=1,2.
    \end{align}

where :math:`s \in [0,L] \subset \mathbb{R}` denotes the arc-length of the line of the centroids :math:`\boldsymbol{\varphi}(s,0)\in \mathbb{R}^3` in 
the initial configuration, :math:`\mathbf{d}_i(s,t)` is an orthonormal triad at :math:`s` with the directors :math:`\mathbf{d}_k(s,t), k=1,2` spanning 
a principle basis of the cross section, and :math:`X^k` are the curvilinear coordinates on the cross section.

For an initially straight beam, the deformation gradient at a point :math:`(X^1, X^2, s)` in the beam can be written as,
 see (Auricchio, 2008),

.. math::
    
    \begin{align}
        \mathbf{F}(X^1, X^2, s,t)&=\frac{\partial \mathbf{x}}{\partial \mathbf{X}}=\frac{\partial \mathbf{x}}{\partial X_i} \otimes  \mathbf{d}_i(s,0) \nonumber\\
        &=\left[ \mathbf{I} + \left(\frac{\partial \boldsymbol{\varphi}(s,t)}{\partial s} - \mathbf{d}_3(s,t) + X^1 \frac{\partial \mathbf{d}_1(s,t)}{\partial s} + X^2 \frac{\partial \mathbf{d}_2(s,t)}{\partial s} \right)\otimes  \mathbf{d}_3(s,t) \right] \boldsymbol{\Lambda}(s),
    \end{align}

with the rotation tensor :math:`\boldsymbol{\Lambda}(s)=\mathbf{d}_i(s,t) \otimes  \mathbf{d}_i(s,0)` 
and :math:`\boldsymbol{\Lambda}(s)^{-1}=\boldsymbol{\Lambda}(s)^T`.

To formulate the electromechanical coupling problem, the electric potential will serve as the extra degree of freedom. In this work, 
the electric potential at a point :math:`(X^1,X^2,s)` is represented by the electric potential at the beam node plus the increment 
from the beam node to the point :math:`(X^1,X^2)` on the cross section. Similar to the local description of the cross section, the electric potential on the cross section is given by

 .. math::
    
    \begin{align} 
        \phi (X^1,X^2,s)=\phi _o(s) + X^1 \alpha(s) + X^2 \beta(s)
    \end{align}

with :math:`\phi _o(s)` the electric potential at the beam node, :math:`\alpha(s)` and :math:`\beta(s)` the incremental parameters 
of the electric potential in the directions of :math:`\mathbf{d}_1` and :math:`\mathbf{d}_2` , respectively. If the electric 
potential is constant within the cross section (i.e. :math:`\alpha,\beta=0` ), the electric field only exists in 
the :math:`\mathbf{d}_3` direction, which will lead to the uniaxial contraction in beam.

According to the Maxwell equations, the electric field is defined as the gradient of the  electric potential :math:`\phi` . 
To compute the gradient of the electric potential for the beam, a similar approach as the deformation gradient can be adopted. 
Based on the formulation of the electric potential, the electric field at :math:`(X^1,X^2,s)` in the beam can be computed as

 .. math::
    
    \begin{align} 
        \mathbf{E}^e(X^1,X^2,s) &= -\frac{\partial \phi}{\partial X_i} \otimes  \mathbf{d}_i(s,0)\\
        & =-\left[ \alpha(s)  \mathbf{d}_1(s,0) + \beta(s)  \mathbf{d}_2(s,0) + \left( \frac{\partial \phi_o(s)}{\partial s}  + X^1 \frac{\partial  \alpha(s)}{\partial s} + X^2 \frac{\partial  \beta(s)}{\partial s} \right) \mathbf{d}_3(s,0) \right]. \label{Ee}
    \end{align}


.. _strainenergy_ibvp:

Coupled free energy in the beam
-------------------------------

When the external electric field is imposed to the body of dielectric elastomer, the contractive pressure will be induced due to 
the polarization effects and thus the deformation of the body will be generated. The coupling effect between the electric field 
and the mechanical deformation is described by the free energy function :math:`\Omega(\mathbf{F}, \mathbf{E}^e)` of the dielectric material 
in the constitutive equations

.. math::

    \begin{align}
        \mathbf{D}=-\rho_0\frac{\partial \Omega(\mathbf{F}, \mathbf{E}^e)}{\partial \mathbf{E}^e},  \;\;\;\;  \mathbf{P}=\rho_0\frac{\partial \Omega(\mathbf{F}, \mathbf{E}^e)}{\partial \mathbf{F}}.
    \end{align}

For the dielectric materials, the electromechanical coupling can be described by the free energy function with the additive form

.. math::

    \begin{align}
        \Omega(\mathbf{F}, \mathbf{E}^e) = \Omega^m (\mathbf{F}) + \Omega^{\rm em}(\mathbf{F}, \mathbf{E}^e)  + \Omega^e( \mathbf{E}^e),
    \end{align}

with :math:`\Omega^m (\mathbf{F})` referring to the purely mechanical behavior, :math:`\Omega^{\rm em}(\mathbf{F}, \mathbf{E}^e)` referring 
to the electomechanical coupling and :math:`\Omega^e( \mathbf{E}^e)` referring to the pure electric behavior.

A widely used strain energy density for dielectric elastomer is given by

.. math::
    
    \begin{align}
        \Omega(\mathbf{C},\mathbf{E}^e)=\underbrace{ \frac{\mu}{2} \left( \mathbf{C} : \mathbf{1}-3 \right) - \mu {\rm ln} J + \frac{\lambda}{2} ({\rm ln} J)^2}_{\text{Neo-Hookean}} +\underbrace{c_1 \mathbf{E}^e \cdot \mathbf{E}^e + c_2 \mathbf{C} : (\mathbf{E}^e \otimes \mathbf{E}^e)}_{\text{Polarization in dielectric material}} - \underbrace{ \frac{1}{2} \varepsilon_0 J \mathbf{C}^{-1} : (\mathbf{E}^e \otimes \mathbf{E}^e)}_{\text{Free space term in vacuum}}
    \end{align}

with :math:`\varepsilon_0` the vacuum permittivity, :math:`c_1` and :math:`c_2` the electrical parameters. 
It can be observed that the strain energy is composed of three parts, the Neo-Hookean part referring to the pure elastic 
behavior, the polarization part referring to the polarization in the condensed matter and the free space part referring to the 
effect in vacuum. The last two terms characterize the electromechanical coupling.

The strain energy function for beam is obtained by integrating :math:`\Omega(\mathbf{C},\mathbf{E}^e)` over the cross section

.. math::
    
    \begin{align}
        \Omega_b (\boldsymbol{\Gamma}, \mathbf{K}, \boldsymbol{\varepsilon}) =\int_{\Sigma} \Omega(\mathbf{C},\mathbf{E}^e) dA,
    \end{align}

where the integration can be evaluated with the numerical approach as well as the analytical approach. As the analytical approach, 
the beam strain energy function :math:`\Omega_b` is explicitly formulated in the Appendix of the paper (Huang and Leyendecker, 2022).
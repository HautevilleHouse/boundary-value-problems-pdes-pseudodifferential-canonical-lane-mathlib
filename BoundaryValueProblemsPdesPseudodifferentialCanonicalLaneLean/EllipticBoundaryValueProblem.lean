import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsPdesPseudodifferential

structure EllipticBoundaryValueProblem where
  domain : Type u
  boundary : domain → Prop
  ellipticOperator : Type v
  boundaryCondition : Type w
  domainSmoothManifold : Prop
  operatorElliptic : Prop
  conditionShapiroLopatinskii : Prop

structure EllipticBoundaryEvidence (E : EllipticBoundaryValueProblem) where
  domainSmoothManifoldClosed : E.domainSmoothManifold
  operatorEllipticClosed : E.operatorElliptic
  conditionShapiroLopatinskiiClosed : E.conditionShapiroLopatinskii

def EllipticBoundaryClosed (E : EllipticBoundaryValueProblem) : Prop :=
  E.domainSmoothManifold ∧ E.operatorElliptic ∧ E.conditionShapiroLopatinskii

theorem elliptic_boundary_closed_from_evidence (E : EllipticBoundaryValueProblem)
    (Ev : EllipticBoundaryEvidence E) : EllipticBoundaryClosed E := by
  exact And.intro Ev.domainSmoothManifoldClosed
    (And.intro Ev.operatorEllipticClosed Ev.conditionShapiroLopatinskiiClosed)

end BoundaryValueProblemsPdesPseudodifferential
end HautevilleHouse
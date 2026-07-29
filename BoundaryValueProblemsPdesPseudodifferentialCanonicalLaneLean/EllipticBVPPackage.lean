import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsPdesPseudodifferentialCanonicalLaneLean

structure EllipticBVPPackage where
  domain : Type u
  boundary : Type v
  operator : Type w
  ellipticCondition : Prop
  boundaryCondition : Prop
  coercivity : Prop

structure EllipticBVPEvidence (E : EllipticBVPPackage) where
  ellipticConditionClosed : E.ellipticCondition
  boundaryConditionClosed : E.boundaryCondition
  coercivityClosed : E.coercivity

def EllipticBVPClosed (E : EllipticBVPPackage) : Prop :=
  E.ellipticCondition ∧ E.boundaryCondition ∧ E.coercivity

theorem elliptic_bvp_closed_from_evidence (E : EllipticBVPPackage) (Ev : EllipticBVPEvidence E) :
    EllipticBVPClosed E := by
  exact And.intro Ev.ellipticConditionClosed (And.intro Ev.boundaryConditionClosed Ev.coercivityClosed)

end BoundaryValueProblemsPdesPseudodifferentialCanonicalLaneLean
end HautevilleHouse
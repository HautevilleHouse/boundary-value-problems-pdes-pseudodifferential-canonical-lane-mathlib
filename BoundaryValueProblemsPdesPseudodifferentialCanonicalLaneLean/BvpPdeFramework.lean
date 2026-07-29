import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsPdesPseudodifferentialCanonicalLaneLean

structure BoundaryValueProblem where
  domain : Type u
  boundary : Type v
  pdeOperator : Type w
  solutionSpace : Type x
  boundaryData : Type y
  wellPosed : Prop
  ellipticCondition : Prop

structure BvpPdeEvidence (B : BoundaryValueProblem) where
  wellPosedClosed : B.wellPosed
  ellipticConditionClosed : B.ellipticCondition

def BvpPdeClosed (B : BoundaryValueProblem) : Prop :=
  B.wellPosed ∧ B.ellipticCondition

theorem bvp_pde_closed_from_evidence (B : BoundaryValueProblem) (E : BvpPdeEvidence B) :
    BvpPdeClosed B := by
  exact And.intro E.wellPosedClosed E.ellipticConditionClosed

end BoundaryValueProblemsPdesPseudodifferentialCanonicalLaneLean
end HautevilleHouse
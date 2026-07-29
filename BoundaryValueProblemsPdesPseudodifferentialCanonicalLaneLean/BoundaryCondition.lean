import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsPdesPseudodifferentialCanonicalLaneLean

inductive BoundaryType where
  | Dirichlet
  | Neumann
  | Robin
  | Transmission

structure BoundaryCondition (Ω : Type*) [TopologicalSpace Ω] where
  boundaryType : BoundaryType
  regularity : ℕ
  coercivityCondition : Prop

structure BoundaryConditionEvidence (B : BoundaryCondition Ω) where
  coercivityConditionClosed : B.coercivityCondition

def BoundaryConditionClosed (B : BoundaryCondition Ω) : Prop :=
  B.coercivityCondition

theorem boundary_condition_closed_from_evidence
    (B : BoundaryCondition Ω) (ev : BoundaryConditionEvidence B) :
    BoundaryConditionClosed B := by
  exact ev.coercivityConditionClosed

end BoundaryValueProblemsPdesPseudodifferentialCanonicalLaneLean
end HautevilleHouse
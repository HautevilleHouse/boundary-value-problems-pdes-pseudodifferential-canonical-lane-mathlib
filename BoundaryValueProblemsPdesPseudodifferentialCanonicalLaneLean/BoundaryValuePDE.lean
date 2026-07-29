import BoundaryValueProblemsPdesPseudodifferentialCanonicalLaneLean.PseudodifferentialOperator

namespace HautevilleHouse
namespace BoundaryValueProblemsPdesPseudodifferentialCanonicalLaneLean

structure BoundaryValuePDE (Ω : Type) [TopologicalSpace Ω] where
  differentialOperator : PseudodifferentialOperator Ω
  sourceTerm : Ω → ℝ
  boundaryOperator : PseudodifferentialOperator (∂ Ω)
  boundaryData : (∂ Ω) → ℝ
  solvabilityCondition : Prop
  regularityEstimate : Prop

structure BoundaryValuePDEEvidence (Ω : Type) [TopologicalSpace Ω] (P : BoundaryValuePDE Ω) where
  solvabilityConditionClosed : P.solvabilityCondition
  regularityEstimateClosed : P.regularityEstimate

def BoundaryValuePDEClosed (Ω : Type) [TopologicalSpace Ω] (P : BoundaryValuePDE Ω) : Prop :=
  P.solvabilityCondition ∧ P.regularityEstimate

theorem boundary_value_pde_closed_from_evidence (Ω : Type) [TopologicalSpace Ω] (P : BoundaryValuePDE Ω)
    (E : BoundaryValuePDEEvidence P) : BoundaryValuePDEClosed P := by
  exact And.intro E.solvabilityConditionClosed E.regularityEstimateClosed

end BoundaryValueProblemsPdesPseudodifferentialCanonicalLaneLean
end HautevilleHouse
import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsPdesPseudodifferentialCanonicalLaneLean

structure ParametrixConstruction (Ω : Type*) [TopologicalSpace Ω] where
  operator : PseudodifferentialOperator Ω
  parametrix : PseudodifferentialOperator Ω
  leftParametrixEquation : Prop
  rightParametrixEquation : Prop
  compactRemainder : Prop

structure ParametrixConstructionEvidence (P : ParametrixConstruction Ω) where
  leftParametrixEquationClosed : P.leftParametrixEquation
  rightParametrixEquationClosed : P.rightParametrixEquation
  compactRemainderClosed : P.compactRemainder

def ParametrixConstructionClosed (P : ParametrixConstruction Ω) : Prop :=
  P.leftParametrixEquation ∧ P.rightParametrixEquation ∧ P.compactRemainder

theorem parametrix_construction_closed_from_evidence
    (P : ParametrixConstruction Ω) (ev : ParametrixConstructionEvidence P) :
    ParametrixConstructionClosed P := by
  exact And.intro ev.leftParametrixEquationClosed
    (And.intro ev.rightParametrixEquationClosed ev.compactRemainderClosed)

end BoundaryValueProblemsPdesPseudodifferentialCanonicalLaneLean
end HautevilleHouse
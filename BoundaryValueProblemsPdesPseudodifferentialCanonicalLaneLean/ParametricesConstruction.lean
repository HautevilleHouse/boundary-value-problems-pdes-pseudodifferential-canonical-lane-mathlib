import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsPdesPseudodifferential

structure ParametrixConstruction (m : ℤ) where
  operatorSymbol : PseudodifferentialSymbol m
  parametrixSymbol : PseudodifferentialSymbol (-m)
  leftInverseModulo : Prop
  rightInverseModulo : Prop
  smoothingRemainder : Prop

structure ParametrixEvidence {m : ℤ} (P : ParametrixConstruction m) where
  leftInverseModuloClosed : P.leftInverseModulo
  rightInverseModuloClosed : P.rightInverseModulo
  smoothingRemainderClosed : P.smoothingRemainder

def ParametrixClosed {m : ℤ} (P : ParametrixConstruction m) : Prop :=
  P.leftInverseModulo ∧ P.rightInverseModulo ∧ P.smoothingRemainder

theorem parametrix_closed_from_evidence {m : ℤ} (P : ParametrixConstruction m)
    (Ev : ParametrixEvidence P) : ParametrixClosed P := by
  exact And.intro Ev.leftInverseModuloClosed
    (And.intro Ev.rightInverseModuloClosed Ev.smoothingRemainderClosed)

end BoundaryValueProblemsPdesPseudodifferential
end HautevilleHouse
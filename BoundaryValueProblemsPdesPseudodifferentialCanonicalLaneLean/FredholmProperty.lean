import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsPdesPseudodifferentialCanonicalLaneLean

structure FredholmProperty (Ω : Type*) [TopologicalSpace Ω] where
  operator : PseudodifferentialOperator Ω
  boundaryCondition : BoundaryCondition Ω
  isFredholm : Prop
  index : ℤ
  kernelFiniteDimensional : Prop
  cokernelFiniteDimensional : Prop

structure FredholmPropertyEvidence (F : FredholmProperty Ω) where
  isFredholmClosed : F.isFredholm
  kernelFiniteDimensionalClosed : F.kernelFiniteDimensional
  cokernelFiniteDimensionalClosed : F.cokernelFiniteDimensional

def FredholmPropertyClosed (F : FredholmProperty Ω) : Prop :=
  F.isFredholm ∧ F.kernelFiniteDimensional ∧ F.cokernelFiniteDimensional

theorem fredholm_property_closed_from_evidence
    (F : FredholmProperty Ω) (ev : FredholmPropertyEvidence F) :
    FredholmPropertyClosed F := by
  exact And.intro ev.isFredholmClosed
    (And.intro ev.kernelFiniteDimensionalClosed ev.cokernelFiniteDimensionalClosed)

end BoundaryValueProblemsPdesPseudodifferentialCanonicalLaneLean
end HautevilleHouse
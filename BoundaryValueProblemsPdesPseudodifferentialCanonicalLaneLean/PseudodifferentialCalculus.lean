import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsPdesPseudodifferentialCanonicalLaneLean

structure PseudodifferentialCalculusPackage where
  symbolClass : Type u
  quantizationMap : symbolClass → ((ℝⁿ → ℝ) → (ℝⁿ → ℝ))
  compositionProperty : Prop
  adjointProperty : Prop
  ellipticInvertibility : Prop

def PseudodifferentialCalculusClosed (P : PseudodifferentialCalculusPackage) : Prop :=
  P.compositionProperty ∧ P.adjointProperty ∧ P.ellipticInvertibility

structure PseudodifferentialCalculusEvidence (P : PseudodifferentialCalculusPackage) where
  compositionPropertyClosed : P.compositionProperty
  adjointPropertyClosed : P.adjointProperty
  ellipticInvertibilityClosed : P.ellipticInvertibility

theorem pseudodifferential_calculus_closed_from_evidence
    (P : PseudodifferentialCalculusPackage)
    (E : PseudodifferentialCalculusEvidence P) : PseudodifferentialCalculusClosed P := by
  exact And.intro E.compositionPropertyClosed
    (And.intro E.adjointPropertyClosed E.ellipticInvertibilityClosed)

end BoundaryValueProblemsPdesPseudodifferentialCanonicalLaneLean
end HautevilleHouse
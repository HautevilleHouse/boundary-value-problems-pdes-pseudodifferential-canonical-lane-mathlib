import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsPdesPseudodifferentialCanonicalLaneLean

structure BoundaryTracePackage where
  domainType : Type u
  boundaryType : Type v
  traceMap : (domainType → ℝ) → (boundaryType → ℝ)
  continuity : Prop
  surjectivity : Prop
  kernelCharacterization : Prop

def BoundaryTraceClosed (B : BoundaryTracePackage) : Prop :=
  B.continuity ∧ B.surjectivity ∧ B.kernelCharacterization

structure BoundaryTraceEvidence (B : BoundaryTracePackage) where
  continuityClosed : B.continuity
  surjectivityClosed : B.surjectivity
  kernelCharacterizationClosed : B.kernelCharacterization

theorem boundary_trace_closed_from_evidence (B : BoundaryTracePackage)
    (E : BoundaryTraceEvidence B) : BoundaryTraceClosed B := by
  exact And.intro E.continuityClosed
    (And.intro E.surjectivityClosed E.kernelCharacterizationClosed)

end BoundaryValueProblemsPdesPseudodifferentialCanonicalLaneLean
end HautevilleHouse
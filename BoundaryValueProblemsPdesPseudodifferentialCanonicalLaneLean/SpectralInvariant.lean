import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsPdesPseudodifferential

structure SpectralInvariantCondition where
  boundaryValueProblem : EllipticBoundaryValueProblem
  spectralCutoff : Type u
  etaInvariant : ℝ
  indexTheorem : Prop
  invarianceUnderSurgery : Prop

structure SpectralInvariantEvidence (S : SpectralInvariantCondition) where
  indexTheoremClosed : S.indexTheorem
  invarianceUnderSurgeryClosed : S.invarianceUnderSurgery

def SpectralInvariantClosed (S : SpectralInvariantCondition) : Prop :=
  S.indexTheorem ∧ S.invarianceUnderSurgery

theorem spectral_invariant_closed_from_evidence (S : SpectralInvariantCondition)
    (Ev : SpectralInvariantEvidence S) : SpectralInvariantClosed S := by
  exact And.intro Ev.indexTheoremClosed Ev.invarianceUnderSurgeryClosed

end BoundaryValueProblemsPdesPseudodifferential
end HautevilleHouse
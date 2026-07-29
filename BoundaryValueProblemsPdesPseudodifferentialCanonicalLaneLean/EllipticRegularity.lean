import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsPdesPseudodifferentialCanonicalLaneLean

structure EllipticRegularityPackage where
  operatorSymbol : Type u
  sobolevSpaces : Prop
  aPrioriEstimate : Prop
  gainRegularity : Prop
  smoothnessPropagation : Prop

def EllipticRegularityClosed (E : EllipticRegularityPackage) : Prop :=
  E.sobolevSpaces ∧ E.aPrioriEstimate ∧ E.gainRegularity ∧ E.smoothnessPropagation

structure EllipticRegularityEvidence (E : EllipticRegularityPackage) where
  sobolevSpacesClosed : E.sobolevSpaces
  aPrioriEstimateClosed : E.aPrioriEstimate
  gainRegularityClosed : E.gainRegularity
  smoothnessPropagationClosed : E.smoothnessPropagation

theorem elliptic_regularity_closed_from_evidence (E : EllipticRegularityPackage)
    (Ev : EllipticRegularityEvidence E) : EllipticRegularityClosed E := by
  exact And.intro Ev.sobolevSpacesClosed
    (And.intro Ev.aPrioriEstimateClosed
      (And.intro Ev.gainRegularityClosed Ev.smoothnessPropagationClosed))

end BoundaryValueProblemsPdesPseudodifferentialCanonicalLaneLean
end HautevilleHouse
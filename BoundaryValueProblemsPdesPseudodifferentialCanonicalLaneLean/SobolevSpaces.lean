import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsPdesPseudodifferentialCanonicalLaneLean

structure SobolevSpacePackage where
  scaleIndex : Type u
  domainSmoothness : Prop
  embeddingTheorems : Prop
  traceOperator : Prop
  interpolationInequalities : Prop
  duality : Prop

structure SobolevSpaceEvidence (S : SobolevSpacePackage) where
  embeddingTheoremsClosed : S.embeddingTheorems
  traceOperatorClosed : S.traceOperator
  interpolationInequalitiesClosed : S.interpolationInequalities
  dualityClosed : S.duality

def SobolevSpaceClosed (S : SobolevSpacePackage) : Prop :=
  S.embeddingTheorems ∧ S.traceOperator ∧ S.interpolationInequalities ∧ S.duality

theorem sobolev_space_closed_from_evidence (S : SobolevSpacePackage)
    (E : SobolevSpaceEvidence S) : SobolevSpaceClosed S := by
  exact And.intro E.embeddingTheoremsClosed
    (And.intro E.traceOperatorClosed
      (And.intro E.interpolationInequalitiesClosed E.dualityClosed))

end BoundaryValueProblemsPdesPseudodifferentialCanonicalLaneLean
end HautevilleHouse
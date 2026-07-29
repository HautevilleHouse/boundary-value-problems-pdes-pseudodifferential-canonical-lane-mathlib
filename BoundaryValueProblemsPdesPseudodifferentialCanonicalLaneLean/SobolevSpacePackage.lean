import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsPdesPseudodifferentialCanonicalLaneLean

structure SobolevSpacePackage where
  spaceType : Type u
  norm : Type v
  embeddingTheorem : Prop
  compactEmbedding : Prop
  traceTheorem : Prop

structure SobolevSpaceEvidence (S : SobolevSpacePackage) where
  embeddingTheoremClosed : S.embeddingTheorem
  compactEmbeddingClosed : S.compactEmbedding
  traceTheoremClosed : S.traceTheorem

def SobolevSpaceClosed (S : SobolevSpacePackage) : Prop :=
  S.embeddingTheorem ∧ S.compactEmbedding ∧ S.traceTheorem

theorem sobolev_space_closed_from_evidence (S : SobolevSpacePackage) (Ev : SobolevSpaceEvidence S) :
    SobolevSpaceClosed S := by
  exact And.intro Ev.embeddingTheoremClosed (And.intro Ev.compactEmbeddingClosed Ev.traceTheoremClosed)

end BoundaryValueProblemsPdesPseudodifferentialCanonicalLaneLean
end HautevilleHouse
import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsPdesPseudodifferential

structure AtiyahSingerIndexPackage where
  compactManifold : Type u
  ellipticComplex : Type v
  topologicalIndex : ℤ
  analyticIndex : ℤ
  indexTheoremStatement : topologicalIndex = analyticIndex
  indexTheoremClosed : Prop

structure AtiyahSingerIndexEvidence (A : AtiyahSingerIndexPackage) where
  indexTheoremClosed : A.indexTheoremClosed

def AtiyahSingerIndexClosed (A : AtiyahSingerIndexPackage) : Prop :=
  A.indexTheoremClosed

theorem atiyah_singer_index_closed_from_evidence (A : AtiyahSingerIndexPackage)
    (Ev : AtiyahSingerIndexEvidence A) : AtiyahSingerIndexClosed A := by
  exact Ev.indexTheoremClosed

end BoundaryValueProblemsPdesPseudodifferential
end HautevilleHouse
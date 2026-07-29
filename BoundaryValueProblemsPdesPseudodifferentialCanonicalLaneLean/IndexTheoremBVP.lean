import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsPdesPseudodifferentialCanonicalLaneLean

structure IndexTheoremBVPPackage where
  ellipticComplex : Type u
  boundaryConditions : Type v
  indexFormula : Prop
  topologicalInvariance : Prop

structure IndexTheoremBVPEvidence (I : IndexTheoremBVPPackage) where
  indexFormulaClosed : I.indexFormula
  topologicalInvarianceClosed : I.topologicalInvariance

def IndexTheoremBVPClosed (I : IndexTheoremBVPPackage) : Prop :=
  I.indexFormula ∧ I.topologicalInvariance

theorem index_theorem_bvp_closed_from_evidence
    (I : IndexTheoremBVPPackage) (E : IndexTheoremBVPEvidence I) :
    IndexTheoremBVPClosed I := by
  exact And.intro E.indexFormulaClosed E.topologicalInvarianceClosed

end BoundaryValueProblemsPdesPseudodifferentialCanonicalLaneLean
end HautevilleHouse
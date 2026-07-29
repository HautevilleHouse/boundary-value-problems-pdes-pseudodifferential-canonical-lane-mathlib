import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsPdesPseudodifferentialCanonicalLaneLean

structure WellposednessBVPPackage where
  domain : Type u
  boundary : Type v
  operator : Type w
  fredholmProperty : Prop
  uniqueSolution : Prop
  continuousDependence : Prop

structure WellposednessBVPEvidence (P : WellposednessBVPPackage) where
  fredholmPropertyClosed : P.fredholmProperty
  uniqueSolutionClosed : P.uniqueSolution
  continuousDependenceClosed : P.continuousDependence

def WellposednessBVPClosed (P : WellposednessBVPPackage) : Prop :=
  P.fredholmProperty ∧ P.uniqueSolution ∧ P.continuousDependence

theorem wellposedness_bvp_closed_from_evidence
    (P : WellposednessBVPPackage) (E : WellposednessBVPEvidence P) :
    WellposednessBVPClosed P := by
  exact And.intro E.fredholmPropertyClosed (And.intro E.uniqueSolutionClosed E.continuousDependenceClosed)

end BoundaryValueProblemsPdesPseudodifferentialCanonicalLaneLean
end HautevilleHouse
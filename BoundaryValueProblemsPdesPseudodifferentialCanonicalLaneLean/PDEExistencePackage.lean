import canonicalLaneMathlib.AdmissibleClass
import BoundaryValueProblemsPdesPseudodifferentialCanonicalLaneLean.AdmissibleClass
import BoundaryValueProblemsPdesPseudodifferentialCanonicalLaneLean.BoundaryValueProblemPackage

namespace HautevilleHouse
namespace BoundaryValueProblemsPdesPseudodifferentialCanonicalLaneLean

structure PDEExistencePackage {M : Type u} [TopologicalSpace M]
    {P : PseudodifferentialOperatorPackage M}
    (B : BoundaryValueProblemPackage P) where
  existenceForSmoothData : Prop
  uniquenessForSmoothData : Prop
  continuousDependence : Prop

structure PDEExistenceEvidence {M : Type u} [TopologicalSpace M]
    {P : PseudodifferentialOperatorPackage M} {B : BoundaryValueProblemPackage P}
    (E : PDEExistencePackage B) where
  existenceForSmoothDataClosed : E.existenceForSmoothData
  uniquenessForSmoothDataClosed : E.uniquenessForSmoothData
  continuousDependenceClosed : E.continuousDependence

def PDEExistenceClosed {M : Type u} [TopologicalSpace M]
    {P : PseudodifferentialOperatorPackage M} {B : BoundaryValueProblemPackage P}
    (E : PDEExistencePackage B) : Prop :=
  E.existenceForSmoothData ∧ E.uniquenessForSmoothData ∧ E.continuousDependence

theorem pde_existence_closed_from_evidence
    {M : Type u} [TopologicalSpace M] {P : PseudodifferentialOperatorPackage M}
    {B : BoundaryValueProblemPackage P} (E : PDEExistencePackage B)
    (Ev : PDEExistenceEvidence E) : PDEExistenceClosed E := by
  exact And.intro Ev.existenceForSmoothDataClosed
    (And.intro Ev.uniquenessForSmoothDataClosed Ev.continuousDependenceClosed)

end BoundaryValueProblemsPdesPseudodifferentialCanonicalLaneLean
end HautevilleHouse
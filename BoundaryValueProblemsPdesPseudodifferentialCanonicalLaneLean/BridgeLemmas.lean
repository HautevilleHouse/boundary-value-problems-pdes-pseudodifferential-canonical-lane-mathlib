import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsPdesPseudodifferentialCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  BVPPWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end BoundaryValueProblemsPdesPseudodifferentialCanonicalLaneLean
end HautevilleHouse

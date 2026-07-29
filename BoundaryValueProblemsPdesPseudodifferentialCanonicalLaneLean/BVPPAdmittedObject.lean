import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsPdesPseudodifferentialCanonicalLaneLean

structure BVPPAdmittedObject where
  operatorSymbol : Type
  boundaryCondition : Type
  wellPosedness : Prop
  conclusion : wellPosedness

def BVPPWitnessClosed (O : BVPPAdmittedObject) : Prop :=
  O.wellPosedness

end BoundaryValueProblemsPdesPseudodifferentialCanonicalLaneLean
end HautevilleHouse

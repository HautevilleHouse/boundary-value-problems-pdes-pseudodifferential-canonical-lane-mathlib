import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsPdesPseudodifferentialCanonicalLaneLean

structure PseudodifferentialOperatorPackage where
  symbolClass : Type u
  operatorOrder : Type v
  quantization : Type w
  compositionFormula : Prop
  parametrices : Prop
  ellipticInvertibility : Prop

structure PsdoEvidence (P : PseudodifferentialOperatorPackage) where
  compositionFormulaClosed : P.compositionFormula
  parametricesClosed : P.parametrices
  ellipticInvertibilityClosed : P.ellipticInvertibility

def PsdoClosed (P : PseudodifferentialOperatorPackage) : Prop :=
  P.compositionFormula ∧ P.parametrices ∧ P.ellipticInvertibility

theorem psdo_closed_from_evidence (P : PseudodifferentialOperatorPackage)
    (E : PsdoEvidence P) : PsdoClosed P := by
  exact And.intro E.compositionFormulaClosed
    (And.intro E.parametricesClosed E.ellipticInvertibilityClosed)

end BoundaryValueProblemsPdesPseudodifferentialCanonicalLaneLean
end HautevilleHouse
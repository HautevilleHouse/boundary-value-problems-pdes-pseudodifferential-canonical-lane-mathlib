import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsPdesPseudodifferentialCanonicalLaneLean

structure PseudodifferentialOperatorPackage where
  symbol : Type u
  order : Prop
  principalSymbol : Prop
  fredholmProperty : Prop
  symbolicCalculus : Prop

structure PseudodifferentialOperatorEvidence (P : PseudodifferentialOperatorPackage) where
  orderClosed : P.order
  principalSymbolClosed : P.principalSymbol
  fredholmPropertyClosed : P.fredholmProperty
  symbolicCalculusClosed : P.symbolicCalculus

def PseudodifferentialOperatorClosed (P : PseudodifferentialOperatorPackage) : Prop :=
  P.order ∧ P.principalSymbol ∧ P.fredholmProperty ∧ P.symbolicCalculus

theorem pseudodifferential_operator_closed_from_evidence (P : PseudodifferentialOperatorPackage)
    (E : PseudodifferentialOperatorEvidence P) : PseudodifferentialOperatorClosed P := by
  exact And.intro E.orderClosed (And.intro E.principalSymbolClosed
    (And.intro E.fredholmPropertyClosed E.symbolicCalculusClosed))

end BoundaryValueProblemsPdesPseudodifferentialCanonicalLaneLean
end HautevilleHouse
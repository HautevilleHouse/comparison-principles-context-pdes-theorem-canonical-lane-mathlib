import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ComparisonPrinciplesContextPdesTheoremCanonicalLaneLean

structure EllipticOperator where
  domain : Type u
  codomain : Type v
  linearSecondOrder : Prop
  uniformlyElliptic : Prop
  boundedCoefficients : Prop

structure EllipticOperatorEvidence (L : EllipticOperator) where
  linearSecondOrderClosed : L.linearSecondOrder
  uniformlyEllipticClosed : L.uniformlyElliptic
  boundedCoefficientsClosed : L.boundedCoefficients

def EllipticOperatorClosed (L : EllipticOperator) : Prop :=
  L.linearSecondOrder ∧ L.uniformlyElliptic ∧ L.boundedCoefficients

theorem elliptic_operator_closed_from_evidence (L : EllipticOperator) (E : EllipticOperatorEvidence L) : EllipticOperatorClosed L := by
  exact And.intro E.linearSecondOrderClosed (And.intro E.uniformlyEllipticClosed E.boundedCoefficientsClosed)

structure EllipticComparisonPrinciplePackage (L : EllipticOperator) where
  domainBounded : Prop
  boundaryRegular : Prop
  subsolutionDefined : Prop
  supersolutionDefined : Prop
  comparisonHolds : Prop

structure EllipticComparisonPrincipleEvidence {L : EllipticOperator} (P : EllipticComparisonPrinciplePackage L) where
  domainBoundedClosed : P.domainBounded
  boundaryRegularClosed : P.boundaryRegular
  subsolutionDefinedClosed : P.subsolutionDefined
  supersolutionDefinedClosed : P.supersolutionDefined
  comparisonHoldsClosed : P.comparisonHolds

def EllipticComparisonPrincipleClosed {L : EllipticOperator} (P : EllipticComparisonPrinciplePackage L) : Prop :=
  P.domainBounded ∧ P.boundaryRegular ∧ P.subsolutionDefined ∧ P.supersolutionDefined ∧ P.comparisonHolds

theorem elliptic_comparison_principle_closed_from_evidence {L : EllipticOperator} (P : EllipticComparisonPrinciplePackage L) (E : EllipticComparisonPrincipleEvidence P) : EllipticComparisonPrincipleClosed P := by
  exact And.intro E.domainBoundedClosed (And.intro E.boundaryRegularClosed (And.intro E.subsolutionDefinedClosed (And.intro E.supersolutionDefinedClosed E.comparisonHoldsClosed)))

end ComparisonPrinciplesContextPdesTheoremCanonicalLaneLean
end HautevilleHouse
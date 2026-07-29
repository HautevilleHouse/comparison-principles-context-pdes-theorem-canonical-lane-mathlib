import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ComparisonPrinciplesContextPdesTheoremCanonicalLaneLean

structure ParabolicOperator where
  domain : Type u
  codomain : Type v
  linearSecondOrder : Prop
  uniformlyElliptic : Prop
  divergenceForm : Prop
  boundedCoefficients : Prop

structure ParabolicOperatorEvidence (L : ParabolicOperator) where
  linearSecondOrderClosed : L.linearSecondOrder
  uniformlyEllipticClosed : L.uniformlyElliptic
  divergenceFormClosed : L.divergenceForm
  boundedCoefficientsClosed : L.boundedCoefficients

def ParabolicOperatorClosed (L : ParabolicOperator) : Prop :=
  L.linearSecondOrder ∧ L.uniformlyElliptic ∧ L.divergenceForm ∧ L.boundedCoefficients

theorem parabolic_operator_closed_from_evidence (L : ParabolicOperator) (E : ParabolicOperatorEvidence L) : ParabolicOperatorClosed L := by
  exact And.intro E.linearSecondOrderClosed (And.intro E.uniformlyEllipticClosed (And.intro E.divergenceFormClosed E.boundedCoefficientsClosed))

structure ParabolicComparisonPrinciplePackage (L : ParabolicOperator) where
  domainCompact : Prop
  boundaryRegular : Prop
  subsolutionDefined : Prop
  supersolutionDefined : Prop
  comparisonHolds : Prop

structure ParabolicComparisonPrincipleEvidence {L : ParabolicOperator} (P : ParabolicComparisonPrinciplePackage L) where
  domainCompactClosed : P.domainCompact
  boundaryRegularClosed : P.boundaryRegular
  subsolutionDefinedClosed : P.subsolutionDefined
  supersolutionDefinedClosed : P.supersolutionDefined
  comparisonHoldsClosed : P.comparisonHolds

def ParabolicComparisonPrincipleClosed {L : ParabolicOperator} (P : ParabolicComparisonPrinciplePackage L) : Prop :=
  P.domainCompact ∧ P.boundaryRegular ∧ P.subsolutionDefined ∧ P.supersolutionDefined ∧ P.comparisonHolds

theorem parabolic_comparison_principle_closed_from_evidence {L : ParabolicOperator} (P : ParabolicComparisonPrinciplePackage L) (E : ParabolicComparisonPrincipleEvidence P) : ParabolicComparisonPrincipleClosed P := by
  exact And.intro E.domainCompactClosed (And.intro E.boundaryRegularClosed (And.intro E.subsolutionDefinedClosed (And.intro E.supersolutionDefinedClosed E.comparisonHoldsClosed)))

def WeakMaximumPrincipleClosed {L : ParabolicOperator} (P : ParabolicComparisonPrinciplePackage L) : Prop :=
  P.comparisonHolds

theorem weak_maximum_principle_closed_from_comparison {L : ParabolicOperator} (P : ParabolicComparisonPrinciplePackage L) (E : ParabolicComparisonPrincipleEvidence P) : WeakMaximumPrincipleClosed P := by
  exact E.comparisonHoldsClosed

end ComparisonPrinciplesContextPdesTheoremCanonicalLaneLean
end HautevilleHouse
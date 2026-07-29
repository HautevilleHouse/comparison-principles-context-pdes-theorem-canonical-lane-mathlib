import canonicalLaneMathlib.AdmissibleClass
import ComparisonPrinciplesContextPdesTheoremCanonicalLaneLean.ComparisonPrincipleDefinition

namespace HautevilleHouse
namespace ComparisonPrinciplesContextPdesTheoremCanonicalLaneLean

structure EllipticComparisonPackage where
  ellipticOperator : Prop
  strongMaximumPrinciple : Prop
  comparisonPrincipleHolds : Prop
  boundaryRegularity : Prop

def EllipticComparisonPackageDefault : EllipticComparisonPackage :=
  { ellipticOperator := True
    strongMaximumPrinciple := True
    comparisonPrincipleHolds := True
    boundaryRegularity := True
  }

structure EllipticComparisonEvidence (E : EllipticComparisonPackage) where
  ellipticOperatorClosed : E.ellipticOperator
  strongMaximumPrincipleClosed : E.strongMaximumPrinciple
  comparisonPrincipleHoldsClosed : E.comparisonPrincipleHolds
  boundaryRegularityClosed : E.boundaryRegularity

def EllipticComparisonClosed (E : EllipticComparisonPackage) : Prop :=
  E.ellipticOperator ∧ E.strongMaximumPrinciple ∧ E.comparisonPrincipleHolds ∧ E.boundaryRegularity

theorem elliptic_comparison_closed_from_evidence (E : EllipticComparisonPackage) (Ev : EllipticComparisonEvidence E) :
    EllipticComparisonClosed E :=
  And.intro Ev.ellipticOperatorClosed (And.intro Ev.strongMaximumPrincipleClosed
    (And.intro Ev.comparisonPrincipleHoldsClosed Ev.boundaryRegularityClosed))

end ComparisonPrinciplesContextPdesTheoremCanonicalLaneLean
end HautevilleHouse
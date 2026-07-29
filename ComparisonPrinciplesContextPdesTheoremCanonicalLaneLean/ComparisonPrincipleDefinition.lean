import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ComparisonPrinciplesContextPdesTheoremCanonicalLaneLean

structure ComparisonPrinciplePackage where
  operatorType : String
  subSolutionDefined : Prop
  superSolutionDefined : Prop
  orderingPreserved : Prop
  maximumPrinciple : Prop

def ComparisonPrinciplePackageDefault : ComparisonPrinciplePackage :=
  { operatorType := "second-order elliptic"
    subSolutionDefined := True
    superSolutionDefined := True
    orderingPreserved := True
    maximumPrinciple := True
  }

structure ComparisonPrincipleEvidence (C : ComparisonPrinciplePackage) where
  operatorTypeClosed : C.operatorType = "second-order elliptic"
  subSolutionDefinedClosed : C.subSolutionDefined
  superSolutionDefinedClosed : C.superSolutionDefined
  orderingPreservedClosed : C.orderingPreserved
  maximumPrincipleClosed : C.maximumPrinciple

def ComparisonPrincipleClosed (C : ComparisonPrinciplePackage) : Prop :=
  C.operatorType = "second-order elliptic" ∧ C.subSolutionDefined ∧ C.superSolutionDefined ∧
  C.orderingPreserved ∧ C.maximumPrinciple

theorem comparison_principle_closed_from_evidence (C : ComparisonPrinciplePackage) (E : ComparisonPrincipleEvidence C) :
    ComparisonPrincipleClosed C :=
  And.intro E.operatorTypeClosed (And.intro E.subSolutionDefinedClosed
    (And.intro E.superSolutionDefinedClosed (And.intro E.orderingPreservedClosed E.maximumPrincipleClosed)))

end ComparisonPrinciplesContextPdesTheoremCanonicalLaneLean
end HautevilleHouse
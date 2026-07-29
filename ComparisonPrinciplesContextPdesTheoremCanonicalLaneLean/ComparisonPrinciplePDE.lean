import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ComparisonPrinciplesContextPdesTheoremCanonicalLaneLean

structure ComparisonPrinciplePDEPackage where
  domainType : Type u
  pdeOperator : domainType → Prop
  subsolutionClass : Prop
  supersolutionClass : Prop
  initialCondition : Prop
  boundaryCondition : Prop
  comparisonInequality : Prop
  uniquenessResult : Prop

structure ComparisonPrinciplePDEevidence (P : ComparisonPrinciplePDEPackage) where
  subsolutionClassClosed : P.subsolutionClass
  supersolutionClassClosed : P.supersolutionClass
  initialConditionClosed : P.initialCondition
  boundaryConditionClosed : P.boundaryCondition
  comparisonInequalityClosed : P.comparisonInequality
  uniquenessResultClosed : P.uniquenessResult

def ComparisonPrinciplePDEClosed (P : ComparisonPrinciplePDEPackage) : Prop :=
  P.subsolutionClass ∧ P.supersolutionClass ∧ P.initialCondition ∧ P.boundaryCondition ∧ P.comparisonInequality ∧ P.uniquenessResult

theorem comparison_principle_pde_closed_from_evidence
    (P : ComparisonPrinciplePDEPackage) (E : ComparisonPrinciplePDEevidence P) :
    ComparisonPrinciplePDEClosed P :=
  And.intro E.subsolutionClassClosed
    (And.intro E.supersolutionClassClosed
      (And.intro E.initialConditionClosed
        (And.intro E.boundaryConditionClosed
          (And.intro E.comparisonInequalityClosed E.uniquenessResultClosed))))

end ComparisonPrinciplesContextPdesTheoremCanonicalLaneLean
end HautevilleHouse
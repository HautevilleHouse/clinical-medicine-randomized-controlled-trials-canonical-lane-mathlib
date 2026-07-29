import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineRandomizedControlledTrialsCanonicalLaneLean

structure DiagnosticTest where
  sensitivity : Float
  specificity : Float
  prevalence : Float
  sensitivityInUnitInterval : Prop
  specificityInUnitInterval : Prop
  prevalenceInUnitInterval : Prop
  ppvCalculatedCorrectly : Prop
  npvCalculatedCorrectly : Prop

structure DiagnosticTestEvidence (D : DiagnosticTest) where
  sensitivityInUnitIntervalClosed : D.sensitivityInUnitInterval
  specificityInUnitIntervalClosed : D.specificityInUnitInterval
  prevalenceInUnitIntervalClosed : D.prevalenceInUnitInterval
  ppvCalculatedCorrectlyClosed : D.ppvCalculatedCorrectly
  npvCalculatedCorrectlyClosed : D.npvCalculatedCorrectly

def DiagnosticTestClosed (D : DiagnosticTest) : Prop :=
  D.sensitivityInUnitInterval ∧ D.specificityInUnitInterval ∧ D.prevalenceInUnitInterval ∧ D.ppvCalculatedCorrectly ∧ D.npvCalculatedCorrectly

theorem diagnostic_test_closed_from_evidence (D : DiagnosticTest) (E : DiagnosticTestEvidence D) :
    DiagnosticTestClosed D := by
  exact And.intro E.sensitivityInUnitIntervalClosed
    (And.intro E.specificityInUnitIntervalClosed
      (And.intro E.prevalenceInUnitIntervalClosed
        (And.intro E.ppvCalculatedCorrectlyClosed E.npvCalculatedCorrectlyClosed)))

end ClinicalMedicineRandomizedControlledTrialsCanonicalLaneLean
end HautevilleHouse
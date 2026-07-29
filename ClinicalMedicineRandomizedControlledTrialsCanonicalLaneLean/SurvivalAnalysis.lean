import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineRandomizedControlledTrialsCanonicalLaneLean

structure SurvivalModel where
  hazardFunction : Float -> Float
  survivalFunction : Float -> Float
  censoringIndicator : Bool
  eventTimes : List Float
  hazardFunctionPositive : Prop
  survivalFunctionDerived : Prop
  censoringHandled : Prop
  eventTimesSorted : Prop

structure SurvivalModelEvidence (S : SurvivalModel) where
  hazardFunctionPositiveClosed : S.hazardFunctionPositive
  survivalFunctionDerivedClosed : S.survivalFunctionDerived
  censoringHandledClosed : S.censoringHandled
  eventTimesSortedClosed : S.eventTimesSorted

def SurvivalModelClosed (S : SurvivalModel) : Prop :=
  S.hazardFunctionPositive ∧ S.survivalFunctionDerived ∧ S.censoringHandled ∧ S.eventTimesSorted

theorem survival_model_closed_from_evidence (S : SurvivalModel) (E : SurvivalModelEvidence S) :
    SurvivalModelClosed S := by
  exact And.intro E.hazardFunctionPositiveClosed
    (And.intro E.survivalFunctionDerivedClosed
      (And.intro E.censoringHandledClosed E.eventTimesSortedClosed))

end ClinicalMedicineRandomizedControlledTrialsCanonicalLaneLean
end HautevilleHouse
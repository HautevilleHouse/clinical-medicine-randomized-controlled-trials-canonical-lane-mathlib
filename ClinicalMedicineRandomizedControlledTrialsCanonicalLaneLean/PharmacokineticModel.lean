import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineRandomizedControlledTrialsCanonicalLaneLean

structure PharmacokineticModel where
  absorptionRate : Float
  eliminationRate : Float
  volumeOfDistribution : Float
  dose : Float
  concentrationCurve : Float -> Float
  absorptionRatePositive : Prop
  eliminationRatePositive : Prop
  volumePositive : Prop
  dosePositive : Prop
  concentrationFormulaValid : Prop

structure PharmacokineticModelEvidence (P : PharmacokineticModel) where
  absorptionRatePositiveClosed : P.absorptionRatePositive
  eliminationRatePositiveClosed : P.eliminationRatePositive
  volumePositiveClosed : P.volumePositive
  dosePositiveClosed : P.dosePositive
  concentrationFormulaValidClosed : P.concentrationFormulaValid

def PharmacokineticModelClosed (P : PharmacokineticModel) : Prop :=
  P.absorptionRatePositive ∧ P.eliminationRatePositive ∧ P.volumePositive ∧ P.dosePositive ∧ P.concentrationFormulaValid

theorem pharmacokinetic_model_closed_from_evidence (P : PharmacokineticModel) (E : PharmacokineticModelEvidence P) :
    PharmacokineticModelClosed P := by
  exact And.intro E.absorptionRatePositiveClosed
    (And.intro E.eliminationRatePositiveClosed
      (And.intro E.volumePositiveClosed
        (And.intro E.dosePositiveClosed E.concentrationFormulaValidClosed)))

end ClinicalMedicineRandomizedControlledTrialsCanonicalLaneLean
end HautevilleHouse
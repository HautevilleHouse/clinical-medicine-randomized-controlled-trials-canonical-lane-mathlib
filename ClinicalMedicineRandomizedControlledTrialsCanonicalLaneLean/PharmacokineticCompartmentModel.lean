import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineRandomizedControlledTrialsCanonicalLaneLean

structure PharmacokineticCompartmentModel where
  compartments : Nat
  volumeOfDistribution : ℝ
  clearance : ℝ
  absorptionRate : ℝ
  eliminationRate : ℝ
  initialDose : ℝ

structure PharmacokineticEvidence (P : PharmacokineticCompartmentModel) where
  volumeOfDistributionPositive : P.volumeOfDistribution > 0
  clearancePositive : P.clearance > 0
  absorptionRateNonnegative : P.absorptionRate ≥ 0
  eliminationRatePositive : P.eliminationRate > 0

def PharmacokineticCompartmentModelClosed (P : PharmacokineticCompartmentModel) : Prop :=
  P.volumeOfDistribution > 0 ∧ P.clearance > 0 ∧ P.absorptionRate ≥ 0 ∧ P.eliminationRate > 0

theorem pharmacokinetic_compartment_model_closed_from_evidence
    (P : PharmacokineticCompartmentModel) (E : PharmacokineticEvidence P) :
    PharmacokineticCompartmentModelClosed P := by
  exact And.intro E.volumeOfDistributionPositive
    (And.intro E.clearancePositive
      (And.intro E.absorptionRateNonnegative E.eliminationRatePositive))

end ClinicalMedicineRandomizedControlledTrialsCanonicalLaneLean
end HautevilleHouse
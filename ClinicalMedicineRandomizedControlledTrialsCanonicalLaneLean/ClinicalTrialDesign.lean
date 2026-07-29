import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineRandomizedControlledTrialsCanonicalLaneLean

structure ClinicalTrialDesign where
  randomizationMethod : String
  blindingLevel : String
  allocationRatio : String
  factorialDesign : Bool
  sampleSizeJustified : Bool

structure ClinicalTrialDesignEvidence (D : ClinicalTrialDesign) where
  randomizationValid : D.randomizationMethod ≠ ""
  blindingAppropriate : D.blindingLevel ∈ ["open", "single", "double"]
  allocationRatioValid : D.allocationRatio ≠ ""
  factorialDesignValid : True
  sampleSizeJustifiedTerm : D.sampleSizeJustified

def ClinicalTrialDesignClosed (D : ClinicalTrialDesign) : Prop :=
  D.randomizationMethod ≠ "" ∧
  D.blindingLevel ∈ ["open", "single", "double"] ∧
  D.allocationRatio ≠ "" ∧
  D.sampleSizeJustified

theorem clinical_trial_design_closed_from_evidence (D : ClinicalTrialDesign) (E : ClinicalTrialDesignEvidence D) : ClinicalTrialDesignClosed D := by
  exact And.intro E.randomizationValid
    (And.intro E.blindingAppropriate
      (And.intro E.allocationRatioValid E.sampleSizeJustifiedTerm))

end ClinicalMedicineRandomizedControlledTrialsCanonicalLaneLean
end HautevilleHouse
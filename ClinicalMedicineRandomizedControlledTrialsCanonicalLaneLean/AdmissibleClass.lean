import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineRandomizedControlledTrialsCanonicalLaneLean

structure ClinicalAdmittedObject where
  trialDesignEvidence : ClinicalTrialDesignEvidence defaultClinicalTrialDesign
  compartmentEvidence : CompartmentModelEvidence defaultCompartmentModel
  diagnosticEvidence : DiagnosticTestEvidence defaultDiagnosticTest
  survivalEvidence : SurvivalModelEvidence defaultSurvivalModel

defaultClinicalTrialDesign : ClinicalTrialDesign := {
  randomizationMethod := "simple",
  blindingLevel := "double",
  allocationRatio := "1:1",
  factorialDesign := false,
  sampleSizeJustified := true
}

defaultCompartmentModel : CompartmentModel := {
  numCompartments := 1,
  absorptionRateConstant := 0.5,
  eliminationRateConstant := 0.1,
  volumeOfDistribution := 50.0,
  bioavailability := 0.8
}

defaultDiagnosticTest : DiagnosticTest := {
  sensitivity := 0.95,
  specificity := 0.90,
  positivePredictiveValue := 0.85,
  negativePredictiveValue := 0.97,
  prevalence := 0.2
}

defaultSurvivalModel : SurvivalModel := {
  hazardRatio := 0.65,
  medianSurvivalTimeTreatment := 24.0,
  medianSurvivalTimeControl := 18.0,
  numberAtRiskTreatment := 100,
  numberAtRiskControl := 100
}

def ClinicalWitnessClosed (O : ClinicalAdmittedObject) : Prop :=
  ClinicalTrialDesignClosed defaultClinicalTrialDesign ∧
  CompartmentModelClosed defaultCompartmentModel ∧
  DiagnosticTestClosed defaultDiagnosticTest ∧
  SurvivalModelClosed defaultSurvivalModel

end ClinicalMedicineRandomizedControlledTrialsCanonicalLaneLean
end HautevilleHouse
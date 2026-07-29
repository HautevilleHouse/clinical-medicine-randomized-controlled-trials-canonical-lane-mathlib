import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineRandomizedControlledTrialsCanonicalLaneLean

structure ClinicalTrialAdmittedObject where
  treatmentGroup : Type
  controlGroup : Type
  outcomeMeasure : Prop
  randomizationValid : Prop
  conclusion : outcomeMeasure

def trialOutcomeClosed (O : ClinicalTrialAdmittedObject) : Prop :=
  O.outcomeMeasure

end ClinicalMedicineRandomizedControlledTrialsCanonicalLaneLean
end HautevilleHouse
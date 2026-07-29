import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineRandomizedControlledTrialsCanonicalLaneLean

structure ClinicalOutcome where
  outcomeType : String
  measurementScale : String
  treatmentEffect : Float
  statisticalSignificance : Bool
  clinicalRelevance : Bool
  outcomeValidity : Prop

structure ClinicalOutcomeEvidence (O : ClinicalOutcome) where
  outcomeValidityClosed : O.outcomeValidity

def ClinicalOutcomeClosed (O : ClinicalOutcome) : Prop :=
  O.outcomeValidity

theorem clinical_outcome_closed_from_evidence (O : ClinicalOutcome) (E : ClinicalOutcomeEvidence O) :
    ClinicalOutcomeClosed O := by
  exact E.outcomeValidityClosed

end ClinicalMedicineRandomizedControlledTrialsCanonicalLaneLean
end HautevilleHouse

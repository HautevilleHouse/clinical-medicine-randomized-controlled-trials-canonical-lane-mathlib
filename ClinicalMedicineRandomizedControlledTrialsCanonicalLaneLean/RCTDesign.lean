import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineRandomizedControlledTrialsCanonicalLaneLean

structure RCTDesign where
  randomizationMethod : String
  blindingType : String
  sampleSize : Nat
  primaryEndpoint : String
  allocationConcealment : Bool
  designValidity : Prop

structure RCTDesignEvidence (R : RCTDesign) where
  designValidityClosed : R.designValidity

def RCTDesignClosed (R : RCTDesign) : Prop :=
  R.designValidity

theorem rct_design_closed_from_evidence (R : RCTDesign) (E : RCTDesignEvidence R) :
    RCTDesignClosed R := by
  exact E.designValidityClosed

end ClinicalMedicineRandomizedControlledTrialsCanonicalLaneLean
end HautevilleHouse

import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineRandomizedControlledTrialsCanonicalLaneLean

structure TrialDesign where
  sampleSize : Nat
  arms : Nat
  allocationRatio : Array ℝ
  randomized : Bool
  blinded : Bool

def allocationBalance (D : TrialDesign) : Prop :=
  D.allocationRatio.sum = 1 ∧ D.allocationRatio.all (λ x => x > 0)

structure BlindingProtocol where
  participantsBlinded : Bool
  investigatorsBlinded : Bool
  outcomeAssessorsBlinded : Bool

def doubleBlind (B : BlindingProtocol) : Prop :=
  B.participantsBlinded ∧ B.investigatorsBlinded

def tripleBlind (B : BlindingProtocol) : Prop :=
  B.participantsBlinded ∧ B.investigatorsBlinded ∧ B.outcomeAssessorsBlinded

structure RandomizationBlindingEvidence (D : TrialDesign) (B : BlindingProtocol) where
  allocationValid : allocationBalance D
  randomizationPerformed : D.randomized
  blindingImplemented : doubleBlind B

def RandomizationBlindingClosed (D : TrialDesign) (B : BlindingProtocol) : Prop :=
  allocationBalance D ∧ doubleBlind B

theorem randomization_blinding_closed_from_evidence (D : TrialDesign) (B : BlindingProtocol) (E : RandomizationBlindingEvidence D B) : RandomizationBlindingClosed D B :=
  And.intro E.allocationValid E.blindingImplemented

end ClinicalMedicineRandomizedControlledTrialsCanonicalLaneLean
end HautevilleHouse
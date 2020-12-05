import { SignalData, Asset } from "./Signal";
import SignalWithGale from "./SignalWithGale";
import FilteringSignal from "./FilteringSignal";
import SignalWithoutGale from "./SignalWithoutGale";
import ExtraAnalysisSignal from "./ExtraAnalysisSignal";

export default class SignalBuilder {
    static create(signalData: SignalData) {
        switch(signalData.type) {
            case 'withGale':
                return new SignalWithGale(signalData);
            case 'filtering':
                return new FilteringSignal(signalData);
            case 'withoutGale':
                return new SignalWithoutGale(signalData);
            case 'extraAnalysis':
                return new ExtraAnalysisSignal(signalData);
            default:
                throw new Error('Invalid signal type');
        }
    }
}